package com.germaniumhq;

import org.apache.commons.compress.archivers.sevenz.SevenZOutputFile;

import java.io.IOException;
import java.io.OutputStream;

public class SevenZOutputStream extends OutputStream {
    private final SevenZOutputFile outputFile;

    public SevenZOutputStream(SevenZOutputFile outputFile) {
        this.outputFile = outputFile;
    }

    @Override
    public void write(byte[] b) throws IOException {
        this.outputFile.write(b);
    }

    @Override
    public void write(byte[] b, int off, int len) throws IOException {
        this.outputFile.write(b, off, len);
    }

    @Override
    public void close() throws IOException {
        this.outputFile.close();
    }

    @Override
    public void write(int b) throws IOException {
        this.outputFile.write(b);
    }

    public SevenZOutputFile getOutputFile() {
        return outputFile;
    }
}
