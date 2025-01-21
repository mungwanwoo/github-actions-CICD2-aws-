# 베이스 이미지
FROM python:3.11-slim

# 작업 디렉터리 설정
WORKDIR /app

# 종속성 파일 복사 및 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN python manage.py collectstatic

# 애플리케이션 코드 복사
COPY . .

# Gunicorn 실행
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi:application"]
