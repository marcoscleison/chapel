config var x = 1;

def main() {
  config var y = zzz;

  for i in 1..10 {
    config var z = 3;

    writeln((x,y,z,i));
  }
}
