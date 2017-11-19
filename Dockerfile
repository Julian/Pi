FROM resin/rpi-raspbian as builder

RUN apt-get update && apt-get install -y \
    gcc \
    libssl-dev \
    libffi-dev \
    make \
    python-pip \
    python-dev \
    python-virtualenv

RUN python -m pip install -U pip setuptools
RUN python -m pip install -U pex
RUN pex --script=ansible-playbook --output-file=/tmp/ansible-playbook.pex ansible==2.4

FROM resin/rpi-raspbian

RUN apt-get update && apt-get install -y python

COPY . /tmp/ansible/
COPY --from=builder /tmp/ansible-playbook.pex /tmp/ansible/ansible-playbook.pex

# Remove some Resin.io nonsense
RUN rm -f \
    /etc/systemd/system/basic.target.wants/launch.service \
    /etc/systemd/system/launch.service

RUN /tmp/ansible/ansible-playbook.pex /tmp/ansible/playbook.yml \
    --inventory-file localhost, \
    --connection local

RUN rm -rf /tmp/ansible/
