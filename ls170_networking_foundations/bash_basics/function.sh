greeting () {
  echo "Hello $1" # Interpolate variable with double-quoted strings
  echo "Hello $2"
}

greeting 'Peter' 'Paul'