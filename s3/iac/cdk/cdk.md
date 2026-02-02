how to use cdk 


# 1. Install AWS CDK CLI globally
npm install -g aws-cdk

# 2. Initialize a new project (sample app in TypeScript)
cdk init sample-app --language=typescript

# 3. Bootstrap the environment (required before first deploy)
cdk bootstrap aws://<account-id>/<region>

# 4. Deploy your stack to AWS
cdk deploy
