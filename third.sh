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
# Stage 4: Compile individual A-scans into B-scan file
#########################################################################################

echo "###"
echo Compiling gpr files
echo "###"

# Call GPRMAX to compile each output file
for i in $( ls $STAGE1_OUTPUT_DIR/*.in ); do
    file=$i
    filename="${file%.*}"
    echo "Compiling model:" $i
    python -m tools.outputfiles_merge $filename 
done

mv $STAGE1_OUTPUT_DIR/*__merged.out $STAGE2_OUTPUT_DIR

# for i in $( ls $STAGE1_OUTPUT_DIR/*.out); do
#     rm $i
# done