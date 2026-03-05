# Build Image
docker build -t app .


# Register Job

aws batch register-job-defineition \
    --job-defintion-name square-job \
    --type cotainer \
    --container-propertiew '{"image: "my-docker-image,"vcpus","memory"}'


# create env
aws batch create-compute-environment \
  --compute-environment-name my-compute-env \
  --type MANAGED \
  --state ENABLED \
  --compute-resources '{
      "type": "EC2",
      "allocationStrategy": "SPOT_CAPACITY_OPTIMIZED",
      "minvCpus": 0,
      "maxvCpus": 16,
      "desiredvCpus": 0,
      "instanceTypes": ["m5.large"],
      "subnets": ["subnet-xxxxxx"],
      "securityGroupIds": ["sg-xxxxxx"],
      "instanceRole": "ecsInstanceRole"
  } \
  --service-role AWSBatchService
  
# Create Queue
aws batch create-job-queue \
  --job-queue-name my-job-queue \
  --state ENABLED \
  --priority 1 \
  --compute-environment-order order=1,computeEnvironment=my-compute-env


# Submit Job

aws batch submit-job \
    --job-name my-job \
    --job-definition square-job \
    --job-queue my-job-queue


# put image to ecr


