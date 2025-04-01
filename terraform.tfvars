prefix = "gulf-gcp-bigip"
instance_count = 2
project_id = "dbg-nss-sbox-17"
image    = "projects/f5-7626-networks-public/global/images/f5-bigip-17-1-2-0-0-8-payg-best-25mbps-241121081543"
region = "europe-west3"
zone = "europe-west3-a"
zone2 = "europe-west3-b"
f5_service_account = "gulfemyumus@gmail.com"
machine_type    = "n2-standard-16"
disk_type       = "pd-ssd" 
min_cpu_platform = "Intel Cascade Lake"
disk_size_gb    = 120

#gcloud compute images list --project=f5-7626-networks-public | grep 17-1-2-0 | grep mbps;;;;;;f5-bigip-17-1-2-0-0-8-payg-best-25mbps-241121081543
#
