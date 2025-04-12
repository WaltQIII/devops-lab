# GCP Free Tier DevOps Lab Setup

## Project Info
- **Project Name:** project-01-lab-setup
- **Project ID:** project-01-lab-setup
- **Zone:** us-central1-a
- **Region:** us-central1
- **Billing:** Free Tier Enabled

## VM Info
- **VM Name:** devops-free-vm
- **Machine Type:** e2-micro (Free Tier eligible)
- **OS:** Ubuntu 22.04 LTS
- **Boot Disk:** 20 GB standard persistent disk
- **External IP:** 34.171.147.125
- **Status:** Running

## SSH Access
- Via GCP Console → Compute Engine → Instances → SSH
- Username: (auto-generated, matches your Google account email)

## Notes
- Cloud Shell used to create VM via gcloud CLI
- Billing account linked but usage within Free Tier limits
- Use `gcloud compute instances stop devops-free-vm` to prevent usage when idle
