# The docker builder for Uno-Chess
Uses submodules to create the final docker image containing the node server with assembled wasm in order to easily host Uno-Chess anywhere.

## Uno-Chess
Uno-Chess is a modification of normal chess in which capture rules have been reversed. A piece can only be captured by any piece in its normal attacking positions. So keep in mind that pawns are more valuable than queens and kings can only be checked from their 8 surrounding squares.

## Setup
```console
git submodule update --init
docker build -t aaronvdiepen/unochess .
```
