# Exadata Storage Server Lab

## Introduction

In this practice, you are introduced to the cellcli utility for querying and manipulating Exadata storage attributes. You will execute list commands to show various Exadata storage components.

Estimated Time: 20 minutes

Watch the video below for a quick walk-through of the lab.
[Explore Exadata Storage](videohub:1_hb8at2jb)

### Objectives

In this lab, you will:
* Execute list commands in cellcli to show Exadata storage features

### Prerequisites

This lab assumes:
* You have access to cellcli on an Exadata storage server or a cellcli simulator

## Task 1: Exadata Storage Objects

1: In Exadata, a LUN (Logical Unit) is a logical abstraction of a storage device. LUNs are based on hard disks and flash devices. LUNs are automatically created when Exadata is initially configured. Each Exadata high capacity cell contains 12 hard disk-based LUNs, 4 flash-based LUNs, and 12 persistent memory LUNs. List the LUNs on your primary Exadata cell. LUN names and identifiers are based on the PCI slot number and device number of the hard disk or flash device.
```text
<copy>
list lun
</copy>
```

2: By default the attributes that are shown with `list lun` are NAME, ID, and STATUS. To include the type of disk to the output, add the DISKTYPE attribute.
```text
<copy>
list lun attributes name, id, status, disktype
</copy>
```

3: Examine the detailed attribute listing for a LUN. Note the attribute setting `isSystemLun=FALSE`. This indicates that the LUN is not located on a system disk. Notice also that the LUN is associated with one physical disk and one cell disk.
```text
<copy>
list lun 0_0 detail
</copy>
```

4: Exadata maintains the physical attributes of each hard disk in a physicaldisk object. A physicaldisk object is automatically created for each hard disk. Examine the attributes for the hard disk associated with a LUN.
```text
<copy>
list physicaldisk where luns = '0_0' detail
</copy>
```

5: A cell disk is a higher level storage abstraction. Each cell disk is based on a LUN and contains additional attributes and metadata. Examine the attributes for the cell disk.
```text
<copy>
list celldisk where devicename = '/dev/sda' detail
</copy>
```

6: A grid disk defines an area of storage on a cell disk. Grid disks are consumed by ASM and are used as the storage for ASM disk groups. Each cell disk can contain a number of grid disks. Examine the grid disks associated with a cell disk. Note the names and sizes of the grid disks.
```text
<copy>
list griddisk where name = 'DATAC1_CD_00_cell01' detail
</copy>
```

## Task 2: Flash Cache

1: List the cell disks associated with the flash modules in your Exadata cell. By default, there should be four cell disks having names that start with FD.
```text
<copy>
list celldisk where disktype = FlashDisk
</copy>
```

2: By default, Exadata Smart Flash Cache is configured across all the flash-based cell disks. Use the `list flashcache detail` command to confirm that Exadata Smart Flash Cache is configured on your flash-based cell disks.
```text
<copy>
list flashcache detail
</copy>
```

3: In addition to Exadata Smart Flash Cache, Exadata Smart Flash Log provides a mechanism for improving the latency of database redo log write operations. Exadata Smart Flash Log uses a small portion of high-performance flash memory as temporary storage to facilitate low latency redo log writes. By default, Exadata Smart Flash Log uses a total of 512 MB on each Exadata Storage Server. Use the `list flashlog detail` command to examine the Exadata Smart Flash Log area on this cell.
```text
<copy>
list flashlog detail
</copy>
```

You may now **proceed to the next lab**.

## Acknowledgements
* **Author** - Seth Miller, Principal Product Manager, Exadata Product Management
* **Contributors** - Alex Blythe, Exadata Product Management
* **Last Updated By/Date** - Seth Miller, June 2023