package main

import (
	"bufio"
	"flag"
	"fmt"
	"io"
	"io/ioutil"
	"os"
	"regexp"
)

var inFileName, outFileName string
var includeFile = regexp.MustCompile("^\\s*\\\\input{(.*)}$")
var endNewline = regexp.MustCompile("\n$")

func main() {
	outFN := flag.String("o", "gopherref_c.tex", "output file name")
	inFN := flag.String("i", "gopherref.tex", "input file name")
	flag.Parse()
	outFileName = *outFN
	inFileName = *inFN

	inFile, err := os.Open(inFileName)
	if err != nil {
		fmt.Println("[!] couldn't open ", inFileName)
		os.Exit(1)
	}

	buf := bufio.NewReader(inFile)

	fullLine := []byte{}
	for {
		line, isPrefix, err := buf.ReadLine()

		if err == io.EOF {
			break
		} else if err != nil {
			fmt.Printf("[!] unrecoverable error reading %s: %s\n",
				inFileName, err.Error())
			os.Exit(1)
		}
		fullLine = append(fullLine, line...)
		if isPrefix {
			continue
		}
		if includeFile.Match(fullLine) {
			includeFile := includeFile.ReplaceAll(fullLine, []byte("$1.tex"))
			fullLine, err = ioutil.ReadFile(string(includeFile))
			if err != nil {
				fmt.Printf("[!] unrecoverable error reading %s: %s\n",
					inFileName, err.Error())
				os.Exit(1)
			}

		}
                appendFile(outFileName, fullLine)
		fullLine = []byte{}
	}
}

func appendFile(fileName string, line []byte) {
	file, err := os.OpenFile(fileName, os.O_WRONLY|os.O_APPEND, 0600)
	if err != nil && os.IsNotExist(err) {
		file, err = os.Create(fileName)
	}

	if err != nil {
		fmt.Printf("[+] unrecoverable error writing %s: %s\n",
			fileName, err.Error())
	}
	defer file.Close()

	_, err = file.Write(line)
	if err != nil {
		fmt.Printf("[+] unrecoverable error writing %s: %s\n",
			fileName, err.Error())
	}
}
