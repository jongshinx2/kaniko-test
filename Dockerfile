# 1. 가벼운 Nginx 이미지를 베이스로 사용
FROM nginx:alpine

# 2. 로컬에 있는 index.html 파일을 컨테이너 안으로 복사
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80