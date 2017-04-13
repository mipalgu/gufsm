int f = open(testfile, O_CREAT, 0644);
close(f);
cout << "OK.\n" << endl;
exit(EXIT_SUCCESS);
