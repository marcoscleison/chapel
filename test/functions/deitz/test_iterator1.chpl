iterator basic() : int {
  var i : int;
  while i < 10 {
    yield i * 4;
    i += 1;
  }
}

writeln( _to_seq( basic()));
