package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	ch:=make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM)
	defer close(ch)
	s := <-ch
	fmt.Println(s)
}