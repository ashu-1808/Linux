# 📊 LVM Commands Comparison Table (Exam + Interview Ready)

![Image](https://miro.medium.com/v2/resize%3Afit%3A1400/1%2Ag0H1kb7u6ZAQ-vObWEY1EA.png)




## 🔷 LVM Layer Comparison

| Layer  | Full Form       | Purpose                                 | Create Command                | Display Command     | Extend Command                   | Remove Command            |
| ------ | --------------- | --------------------------------------- | ----------------------------- | ------------------- | -------------------------------- | ------------------------- |
| **PV** | Physical Volume | Converts disk into LVM usable format    | `pvcreate /dev/xvdb`          | `pvs` / `pvdisplay` | ❌ Not applicable                 | `pvremove /dev/xvdb`      |
| **VG** | Volume Group    | Combines multiple PVs into storage pool | `vgcreate myvg /dev/xvdb`     | `vgs` / `vgdisplay` | `vgextend myvg /dev/xvdc`        | `vgremove myvg`           |
| **LV** | Logical Volume  | Creates partition from VG               | `lvcreate -L 1G -n mylv myvg` | `lvs` / `lvdisplay` | `lvextend -L +1G /dev/myvg/mylv` | `lvremove /dev/myvg/mylv` |


## 🔷 Resize Comparison (Very Important)

| Task        | Command                           | Extra Step Required       |
| ----------- | --------------------------------- | ------------------------- |
| Extend LV   | `lvextend -L +1G /dev/myvg/mylv`  | Yes (resize filesystem)   |
| Resize XFS  | `xfs_growfs /mountpoint`          | Must be mounted           |
| Resize EXT4 | `resize2fs /dev/myvg/mylv`        | Can be mounted/unmounted  |
| Reduce LV   | `lvreduce -L 500M /dev/myvg/mylv` | ⚠ Must unmount + fs check |


---
## 🔷 Display Commands Difference

| Command | Shows Summary | Shows Detailed Info |
| ------- | ------------- | ------------------- |
| PV      | `pvs`         | `pvdisplay`         |
| VG      | `vgs`         | `vgdisplay`         |
| LV      | `lvs`         | `lvdisplay`         |

👉 **Shortcut Rule:**

- Commands ending with s- → Short summary
- Commands ending with display → Detailed information

---

## 🔷 Complete Workflow Mapping

| Step | Layer      | Command Example               |
| ---- | ---------- | ----------------------------- |
| 1    | Check Disk | `lsblk`                       |
| 2    | Create PV  | `pvcreate /dev/xvdb`          |
| 3    | Create VG  | `vgcreate myvg /dev/xvdb`     |
| 4    | Create LV  | `lvcreate -L 2G -n mylv myvg` |
| 5    | Format     | `mkfs.xfs /dev/myvg/mylv`     |
| 6    | Mount      | `mount /dev/myvg/mylv /data`  |

---

# 🎯 One-Line Memory Trick

Disk → PV → VG → LV → Filesystem → Mount
