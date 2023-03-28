# 노드 버전 명시
FROM node:current-slim

WORKDIR /app

COPY . .

# 파일 삭제 : 파일이 없을 경우 오류가 발생하므로 '|| true' 추가
RUN rm package-lock.json || true

RUN npm install

# 모든 호스트 허용(?) 맞는지 확인해야 함
ENV HOST 0.0.0.0

# 포트
EXPOSE 3000

# 실행
CMD ["npm", "start"]

# 도커 빌드 
# docker build --tag 이미지명:버전 .(여기서 .은 폴더 전체를 빌드한다는 뜻)
# docker build --tag assamo-auto-deploy:0.0.1 .

# 도커 실행
# docker run --name 컨테이너에들어갈이름 -d -p 내로컬포트:도커개방포트 이미지명:버전
# docker run --name assamo-auto-deplay -d -p 80:3000 assamo-auto-deploy:0.0.1

# 도커 실행 프로세스 모두 보기
# docker ps -a