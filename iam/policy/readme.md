## Convert to json


the command
```sh
cat policy.yml | yq -j > policy.json
```

the bash script

```sh
./convert
```

```sh
aws iam create-policy \
--policy-name my-fun-policy \
--policy-document file://policy.json
```

## attach Policy to user

```sh
aws iam attach-user-policy \
--policy-arn arn:aws:iam::288761725991:policy/my-fun-policy \
--user-name admin
``` 


## Deleting Policies
```sh
aws iam delete-policy-version \
--policy-arn arn:aws:iam::288761725991:policy/my-fun-policy \
--version-id v2
--version-id v3
--version-id v4
--version-id v1
```