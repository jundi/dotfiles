create-archive.sh
preprocess-spec-m4-macros.sh include/rhel9

for spec_path in rpmbuild/SPECS/*.spec ; do
    echo "### Install dependencies for $spec_path"
    sudo dnf builddep -y "$spec_path"
done

build-rpm.sh
