# Path names
export GPRMAX_HOME=$(pwd)
export GPRMAX=$(pwd)/gprMax
export PYTHON_SCRIPTS=$(pwd)/scripts_python

export ROOT_DIR=$(pwd)/data

export STAGE1_OUTPUT_DIR=$ROOT_DIR/stage1
export STAGE2_OUTPUT_DIR=$ROOT_DIR/stage2
export STAGE3_OUTPUT_DIR=$ROOT_DIR/stage3

export WITH_MODEL_NAME="with"
export WITHOUT_MODEL_NAME="without"


#########################################################################################
# Stage 5: Convert B-scan into numpy array, normalise, plot and save
#########################################################################################

echo "###"
echo "Saving B-scan radargrams"
echo "###"

cd $PYTHON_SCRIPTS

for i in $( ls $STAGE2_OUTPUT_DIR/*.out ); do
    python post_process.py $i Ez $STAGE3_OUTPUT_DIR n
done

echo "Data generation complete"
echo "###"
