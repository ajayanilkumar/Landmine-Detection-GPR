#!/bin/bash

#########################################################################################
# Pipeline to simulate, archive and process gpr data
#########################################################################################

# Path names
export GPRMAX_HOME=$(pwd)
export GPRMAX=$(pwd)/gprMax
export PYTHON_SCRIPTS=$(pwd)/scripts_python

#########################################################################################
# Stage 1: Create directory structure to hold data from each stage in the pipeline
#########################################################################################

echo "###"
echo "Starting..."
date
echo "###"

# Define root directory
export ROOT_DIR=$(pwd)/data

# Define location of temporary directories
# which hold the output from each stage of the pipeline
export STAGE1_OUTPUT_DIR=$ROOT_DIR/stage1
export STAGE2_OUTPUT_DIR=$ROOT_DIR/stage2
export STAGE3_OUTPUT_DIR=$ROOT_DIR/stage3

# Create root data directory if it doesn't exist
if [ ! -d "$ROOT_DIR" ]; then
    echo "Creating root directory: $ROOT_DIR"
    mkdir $ROOT_DIR
fi

# Create directories for main stages of pipeline if they don't exist
for dir in "$STAGE1_OUTPUT_DIR" "$STAGE2_OUTPUT_DIR" "$STAGE3_OUTPUT_DIR"; do
    if [ ! -d "$dir" ]; then
        echo "Creating directory: $dir"
        mkdir $dir
    else
        echo "Directory exists: $dir"
    fi
done

#########################################################################################
# Stage 2: Generate random sample data
#########################################################################################

export WITH_MODEL_NAME="with"
export WITHOUT_MODEL_NAME="without"

cd $GPRMAX_HOME

echo "###"
echo "Creating gpr files"
echo "###"

START=11
END=11

for i in $(seq $START $END);
do
    #$PYTHON_SCRIPTS/gen-test.py -n $WITHOUT_MODEL_NAME -f 1.5 -x 200 -o $STAGE1_OUTPUT_DIR -r n -fi $i
    # Uncomment the next line if needed
    $PYTHON_SCRIPTS/gen-test.py -n $WITH_MODEL_NAME -f 0.5 -w 200 -o $STAGE1_OUTPUT_DIR -mt anti_tank -r n -fi $i
done
