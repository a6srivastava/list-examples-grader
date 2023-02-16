CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
cd student-submission
echo 'Finished cloning'
if [[ -f ListExamples.java ]]; then
   echo "File ListExamples.java exists."
   
else
   echo "File ListExamples.java does not exist."
fi
cd ..
cp TestListExamples.java student-submission
cd student-submission
javac -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" *.java
if [ $? -eq 0 ]; then
    echo "successful compilation"
else
    echo "Failed to compile"
fi
java -cp  ".;../lib/junit-4.13.2.jar;../lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples | tail -n 2 >> total_output.txt #> result.txt
cat total_output.txt  
#grep -e Tests
#set -e
#javac ListExamples.java
#java ListExamples