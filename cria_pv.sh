export storage_host=10.156.4.59
export storage_nfs_directory=/nfs-server/pvs

export nfs_server="/var/opt/pv-defs"
export voldir="/var/opt/pv-defs"
export volsize1="1Gi"
export volsize2="5Gi"
export volsize3="10Gi"

mkdir ${voldir}
for volume in pv{1..25} ; do
echo > /${voldir}/${volume}
{
  "apiVersion": "v1",
  "kind": "PersistentVolume",
  "metadata": {
    "name": "${volume}"
  },
  "spec": {
    "capacity": {
        "storage": "${volsize1}"
    },
    "accessModes": [ "ReadWriteOnce" ],
    "nfs": {
        "path": "${storage_nfs_directory}/${volume}",
        "server": "${storage_host}"
    },
    "persistentVolumeReclaimPolicy": "Recycle"
  }
echo "Created def file for ${volume} ${volsize1}";
for volume in pv{25..75} ; do
echo > /${voldir}/${volume}
{
  "apiVersion": "v1",
  "kind": "PersistentVolume",
  "metadata": {
    "name": "${volume}"
  },
  "spec": {
    "capacity": {
        "storage": "${volsize1}"
    },
    "accessModes": [ "ReadWriteOnce" ],
    "nfs": {
        "path": "${storage_nfs_directory}/${volume}",
        "server": "${storage_host}"
    },
    "persistentVolumeReclaimPolicy": "Recycle"
  }
echo "Created def file for ${volume} ${volsize1}"
for volume in pv{75..100} ; do
echo > /${voldir}/${volume}
{
  "apiVersion": "v1",
  "kind": "PersistentVolume",
  "metadata": {
    "name": "${volume}"
  },
  "spec": {
    "capacity": {
        "storage": "${volsize3}"
    },
    "accessModes": [ "ReadWriteOnce" ],
    "nfs": {
        "path": "${storage_nfs_directory}/${volume}",
        "server": "${storage_host}"
    },
    "persistentVolumeReclaimPolicy": "Recycle"
  }
echo "Created def file for ${volume} ${volsize3}"

done;
