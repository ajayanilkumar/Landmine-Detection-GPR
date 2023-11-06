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
# Stage 3: Process random sample data using gprMax
#########################################################################################


echo "###"
echo "Creating simulated environments"
echo "###"

export number_iters=10

cd $GPRMAX

# Call GPRMAX to process each input file
for i in $( ls $STAGE1_OUTPUT_DIR/*.in ); do
    echo "Running model:" $i
    python3 -m gprMax $i -n $number_iters 
done