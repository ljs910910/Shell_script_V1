#### logs_api_size_check.sh
- 기존 일 단위 로그 압축에서 특정 사이즈 이상일 경우 압축 진행
- 일 단위는 로그 사이즈가 비대하여, JOB 구동 간 API 처리 지연 발생
- 특정 사이즈 이상일 경우 압축을 진행하도록 하여 로그 처리 개선 및 API 처리 지연 해소
