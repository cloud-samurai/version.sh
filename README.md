### Example usage

#### increment a version in var
```bash
export current_version="1.3.5" \
    && wget -qO- https://raw.githubusercontent.com/davemaple/version.sh/main/increment_semantic_version.sh | bash -s -- --increment=minor "1.4.7"
```

#### increment a .version file
```bash
export current_version="1.3.5" \
    && wget -qO- https://raw.githubusercontent.com/davemaple/version.sh/main/increment_semantic_file.sh | bash -s -- --increment=minor ./version
```
