if (ok) cerr << "OK.\n" << endl;
else {
 cerr << "*** Error: OnSuspend did not run." << endl;
  unlink(testfile);
  exit(EXIT_FAILURE);
}
int f = open(testfile, O_CREAT, 0644);
close(f);

// should never run twice
ok = false;
