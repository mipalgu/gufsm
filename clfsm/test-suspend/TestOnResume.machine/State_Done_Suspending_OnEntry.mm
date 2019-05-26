if (ok) cerr << "OK.\n" << endl;
else {
  unlink(testfile);
  cerr << " *** Error: should be suspended!" << endl;
}
