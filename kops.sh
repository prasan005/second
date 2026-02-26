#! /bin/bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops
sudo mv kops /usr/local/bin/kops
chmod +x kubectl
mv kubectl /usr/local/bin/kubectl

export KOPS_STATE_STORE=s3://prasanth11.k8s
kops create cluster --name aunnathya.k8s.local --zones us-east-1a,us-east-1b --master-count=1 --master-size t3.small --master-volume-size=30 --node-count=2 --node-size t3.micro --node-volume-size=20
kops update cluster --name aunnathya.k8s.local --yes --admin
~
