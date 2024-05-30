#!/bin/bash

#!/usr/bin/env bash
# Create a text file with the question to be asked to the chatbot
# Using the python files in the project to provide context

OUTFILE=$(mktemp -t llm_question_XXXXXX.txt)
TMPFILE=$(mktemp -t code_XXXXXX.txt)

~/.venv/bin/python3 ~/.dotfiles/poetry/poetry_to_markdown.py \
  --exclude-files='' \
  --include-extensions='.md,.yml,.cfg' \
  --exclude-dirs='' \
  --additional-files='Dockerfile,Makefile,bin/bootstrap,bin/apply' \
  --root-dir=. \
  --output-file=$TMPFILE

cat $TMPFILE | pbcopy

