if (ok) cerr << "OK.\n" << endl;
else {
 cerr << "*** Error: resume_self() did not work." << endl;
  unlink(testfile);
  exit(EXIT_FAILURE);
}
