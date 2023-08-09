package main

import (
	"fmt"
	"path"

	"github.com/lukeroth/gdal"
)

func main() {

	fmt.Printf("Read only layer count: %v\nRead/Write layer count: %v\n",
		gdal.OpenDataSource(path.Join("2010_Census_Blocks.gdb.zip"), 0).LayerCount(),
		gdal.OpenDataSource(path.Join("2010_Census_Blocks.gdb.zip"), 1).LayerCount(),
	)
}
