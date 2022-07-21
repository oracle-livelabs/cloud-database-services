# Exadata Storage Server Lab

## Exadata Storage Objects

In Exadata, a LUN (Logical Unit) is a logical abstraction of a storage device. LUNs are based on hard disks and flash devices. LUNs are automatically created when Exadata is initially configured. Each Exadata high capacity cell contains 12 hard disk-based LUNs, 4 flash-based LUNs, and 12 persistent memory LUNs. List the LUNs on your primary Exadata cell. LUN names and identifiers are based on the PCI slot number and device number of the hard disk or flash device.

    LIST LUN

By default the attributes that are shown with `LIST LUN` are NAME, ID, and STATUS. To include the type of disk to the output, add the DISKTYPE attribute.

    LIST LUN ATTRIBUTES NAME, ID, STATUS, DISKTYPE

Examine the detailed attribute listing for a LUN. Note the attribute setting `isSystemLun=FALSE`. This indicates that the LUN is not located on a system disk. Notice also that the LUN is associated with one physical disk and one cell disk.

    LIST LUN 0_0 DETAIL

Exadata maintains the physical attributes of each hard disk in a physicaldisk object. A physicaldisk object is automatically created for each hard disk. Examine the attributes for the hard disk associated with a LUN.

    LIST PHYSICALDISK WHERE LUNS = '0_0' DETAIL

A cell disk is a higher level storage abstraction. Each cell disk is based on a LUN and contains additional attributes and metadata. Examine the attributes for the cell disk.

    LIST CELLDISK WHERE DEVICENAME = '/dev/sda' DETAIL

A grid disk defines an area of storage on a cell disk. Grid disks are consumed by ASM and are used as the storage for ASM disk groups. Each cell disk can contain a number of grid disks. Examine the grid disks associated with a cell disk. Note the names and sizes of the grid disks.

    LIST GRIDDISK WHERE NAME LIKE '.*DATA.*_CD_00.*' DETAIL

## Flash Cache

List the cell disks associated with the flash modules in your Exadata cell. By default, there should be four cell disks having names that start with FD.

    LIST CELLDISK WHERE DISKTYPE = FLASHDISK

By default, Exadata Smart Flash Cache is configured across all the flash-based cell disks. Use the `LIST FLASHCACHE DETAIL` command to confirm that Exadata Smart Flash Cache is configured on your flash-based cell disks.

    LIST FLASHCACHE DETAIL

In addition to Exadata Smart Flash Cache, Exadata Smart Flash Log provides a mechanism for improving the latency of database redo log write operations. Exadata Smart Flash Log uses a small portion of high-performance flash memory as temporary storage to facilitate low latency redo log writes. By default, Exadata Smart Flash Log uses a total of 512 MB on each Exadata Storage Server. Use the `LIST FLASHLOG DETAIL` command to examine the Exadata Smart Flash Log area on this cell.

    LIST FLASHLOG DETAIL

Use the `LIST FLASHCACHECONTENT DETAIL` command to show information about the data inside Exadata Smart Flash Cache. You can see that each entry contains a series of attributes relating to a database object in the cache. For each object, you can see how much data is being cached along with the number of cache hits and misses. This information can help you to assess cache efficiency for specific database objects.

    LIST FLASHCACHECONTENT DETAIL

## Persistent Memory

List the cell disks associated with the persistent memory (Pmem) modules in your Exadata cell.

    LIST CELLDISK WHERE DISKTYPE = PMEM

By default, Exadata Smart Pmem Cache is configured across all the Pmem-based cell disks. Use the `LIST PMEMCACHE DETAIL` command to confirm that Exadata Smart Pmem Cache is configured on your Pmem-based cell disks.

    LIST PMEMCACHE DETAIL

In addition to Exadata Smart Pmem Cache, Exadata Smart Pmem Log provides a mechanism for improving the latency of database redo log write operations. Exadata Smart Pmem Log uses a small portion of high-performance persistent memory as temporary storage to facilitate low latency redo log writes.

    LIST PMEMLOG DETAIL
