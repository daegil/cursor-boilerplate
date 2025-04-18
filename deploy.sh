#!/bin/bash

# 기존 빌드 파일 삭제
rm -rf dist/ build/ cursor_boilerplate.egg-info/

# .cursor 디렉토리를 패키지 디렉토리로 복사
rm -rf cursor_boilerplate/.cursor
cp -r .cursor cursor_boilerplate/

# 패키지 빌드
python -m build

# PyPI에 업로드 (환경 변수 사용)
export TWINE_USERNAME="__token__"
export TWINE_PASSWORD="${PYPI_TOKEN}"
twine upload --repository pypi dist/* 
