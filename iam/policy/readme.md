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