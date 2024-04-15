## Pulls secrets from AWS SM

python3 -m ensurepip
python3 -m pip install awscli --upgrade 
if [[ -n ${NODE_ENV} ]];then
    FILENAME=".env.${NODE_ENV}"
else
    FILENAME=".env"
fi     
aws secretsmanager get-secret-value --secret-id ${AWS_SECRET_ID} --region "eu-west-1" | \
  jq -r '.SecretString' | \
  jq -r "to_entries|map(\"\(.key)=\\\"\(.value|tostring)\\\"\")|.[]" > "${FILENAME}"
