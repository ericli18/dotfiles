!/bin/bash

directories=(
  "/usr/share/sway/config.d"
  "/etc/sway/config.d"
)

# Function to copy files
copy_files() {
  local src_dir="$1"
  if [ -d "$src_dir" ]; then
    echo "Copying files from $src_dir"
    for file in "$src_dir"/*.conf; do
      if [ -f "$file" ]; then
        cp "$file" ./sway-utils/
        echo "Copied $(basename "$file")"
      fi
    done
  else
    echo "Directory $src_dir does not exist. Skipping."
  fi
}

# Copy files from each directory
for dir in "${directories[@]}"; do
  copy_files "$dir"
done

echo "All .conf files have been copied to ./sway-utils/"

# Create the include line in a separate file
echo "include '$(realpath ./sway-utils)/*.conf'" >./sway-utils/sway_config_include.conf

echo "Created include line in ./sway-utils/sway_config_include.conf"
