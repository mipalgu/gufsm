int f = open(testfile, O_CREAT, 0644);
close(f);
cerr << "Done creating " << testfile << endl;
