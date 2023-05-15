### Example usage

#### increment a patch version in var
```bash
export current_version="1.3.5"
wget -qO- https://raw.githubusercontent.com/davemaple/version.sh/main/increment_semantic_version.sh | bash -s -- --increment=patch "$current_version"
```

#### increment a minor version in var
```bash
export current_version="1.3.5"
wget -qO- https://raw.githubusercontent.com/davemaple/version.sh/main/increment_semantic_version.sh | bash -s -- --increment=minor "$current_version"
```

#### increment a minor version in var
```bash
export current_version="1.3.5"
wget -qO- https://raw.githubusercontent.com/davemaple/version.sh/main/increment_semantic_version.sh | bash -s -- --increment=major "$current_version"
```


#### increment a .version file
```bash
wget -qO- --no-cache https://raw.githubusercontent.com/davemaple/version.sh/main/increment_semantic_file.sh | bash -s -- --increment=minor .version
```
