# to set environment variables directly from AWS SM
echo "Setting Environment Params"
eval "export $(echo "$AWS_AUTO_SECRET_ENV_VARIABLES" | jq -r 'to_entries | map("\(.key)=\(.value)") | @sh')"
