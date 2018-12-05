cp /vagrant/contrail-ansible-deployer-5.0.2-0.360.tgz /home/vagrant/
cp /vagrant/scripts/instances1.yaml /home/vagrant/instances.yaml
tar -zxvf /home/vagrant/contrail-ansible-deployer-5.0.2-0.360.tgz

cp /home/vagrant/instances.yaml /home/vagrant/contrail-ansible-deployer/config/instances.yaml
cd /home/vagrant/contrail-ansible-deployer

pwd

ansible-playbook -i inventory/ -e orchestrator=openstack playbooks/configure_instances.yml
ansible-playbook -i inventory/ -e orchestrator=openstack playbooks/install_openstack.yml
ansible-playbook -i inventory/ -e orchestrator=openstack playbooks/install_contrail.yml
