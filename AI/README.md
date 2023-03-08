pip install --upgrade openai
export OPENAI_API_KEY="<OPENAI_API_KEY>"
openai tools fine_tunes.prepare_data -f <LOCAL_FILE>
openai api fine_tunes.create -t <TRAIN_FILE_ID_OR_PATH> -m <BASE_MODEL>
openai api fine_tunes.follow -i <YOUR_FINE_TUNE_JOB_ID>


# List all created fine-tunes
openai api fine_tunes.list

# Retrieve the state of a fine-tune. The resulting object includes
# job status (which can be one of pending, running, succeeded, or failed)
# and other information
openai api fine_tunes.get -i <YOUR_FINE_TUNE_JOB_ID>

# Cancel a job
openai api fine_tunes.cancel -i <YOUR_FINE_TUNE_JOB_ID>


