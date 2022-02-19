provider "google" {
  credentials = file("credentials.json")
  project = "unifi-236602"
  region  = "us-central1"
  zone    = "us-central1-c"
}

