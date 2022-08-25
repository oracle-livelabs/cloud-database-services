# Exadata Storage Server Lab

## Introduction

In this practice, you are introduced to the cellcli utility for querying and manipulating Exadata storage attributes. You will execute list commands to show various Exadata storage components.

Estimated Lab Time: 20 minutes

### Objectives

In this lab, you will:
* Execute list commands in cellcli to show Exadata storage features

### Prerequisites

This lab assumes:
* You have access to cellcli on an Exadata storage server or a cellcli simulator

## Exadata Storage Objects

In Exadata, a LUN (Logical Unit) is a logical abstraction of a storage device. LUNs are based on hard disks and flash devices. LUNs are automatically created when Exadata is initially configured. Each Exadata high capacity cell contains 12 hard disk-based LUNs, 4 flash-based LUNs, and 12 persistent memory LUNs. List the LUNs on your primary Exadata cell. LUN names and identifiers are based on the PCI slot number and device number of the hard disk or flash device.

    list lun

By default the attributes that are shown with `list lun` are NAME, ID, and STATUS. To include the type of disk to the output, add the DISKTYPE attribute.

    list lun attributes name, id, status, disktype

Examine the detailed attribute listing for a LUN. Note the attribute setting `isSystemLun=FALSE`. This indicates that the LUN is not located on a system disk. Notice also that the LUN is associated with one physical disk and one cell disk.

    list lun 0_0 detail

Exadata maintains the physical attributes of each hard disk in a physicaldisk object. A physicaldisk object is automatically created for each hard disk. Examine the attributes for the hard disk associated with a LUN.

    list physicaldisk where luns = '0_0' detail

A cell disk is a higher level storage abstraction. Each cell disk is based on a LUN and contains additional attributes and metadata. Examine the attributes for the cell disk.

    list celldisk where devicename = '/dev/sda' detail

A grid disk defines an area of storage on a cell disk. Grid disks are consumed by ASM and are used as the storage for ASM disk groups. Each cell disk can contain a number of grid disks. Examine the grid disks associated with a cell disk. Note the names and sizes of the grid disks.

    list griddisk where name = 'DATAC1_CD_00_cell01' detail

## Flash Cache

List the cell disks associated with the flash modules in your Exadata cell. By default, there should be four cell disks having names that start with FD.

    list celldisk where disktype = FlashDisk

By default, Exadata Smart Flash Cache is configured across all the flash-based cell disks. Use the `list flashcache detail` command to confirm that Exadata Smart Flash Cache is configured on your flash-based cell disks.

    list flashcache detail

In addition to Exadata Smart Flash Cache, Exadata Smart Flash Log provides a mechanism for improving the latency of database redo log write operations. Exadata Smart Flash Log uses a small portion of high-performance flash memory as temporary storage to facilitate low latency redo log writes. By default, Exadata Smart Flash Log uses a total of 512 MB on each Exadata Storage Server. Use the `list flashlog detail` command to examine the Exadata Smart Flash Log area on this cell.

    list flashlog detail

## Persistent Memory

List the cell disks associated with the persistent memory (Pmem) modules in your Exadata cell.

    list celldisk where disktype = PMEM

By default, Exadata Smart Pmem Cache is configured across all the Pmem-based cell disks. Use the `list pmemcache detail` command to confirm that Exadata Smart Pmem Cache is configured on your Pmem-based cell disks.

    list pmemcache detail

In addition to Exadata Smart Pmem Cache, Exadata Smart Pmem Log provides a mechanism for improving the latency of database redo log write operations. Exadata Smart Pmem Log uses a small portion of high-performance persistent memory as temporary storage to facilitate low latency redo log writes.

    list pmemlog detail