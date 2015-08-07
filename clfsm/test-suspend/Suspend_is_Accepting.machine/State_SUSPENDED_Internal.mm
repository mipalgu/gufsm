if (ok) cerr << "OK.\n" << endl;
else {
 cerr << "Error: suspend state is not accepting" << endl;
  unlink(testfile);
  exit(EXIT_FAILURE);
}
int f = open(testfile, O_CREAT, 0644);
close(f);

ok = false;
