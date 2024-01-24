FROM python:3.11-slim 

RUN python -m pip install --no-cache-dir "copernicusmarine>=1.0<=2.0" \
    && rm -Rf /root/.cache/pip

ENTRYPOINT ["copernicusmarine"]