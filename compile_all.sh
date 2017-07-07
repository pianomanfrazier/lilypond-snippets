for i in *.ly;
do
  echo "processing ${i}"
  ./lily.sh ${i%.*}
done
