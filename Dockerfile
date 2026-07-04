FROM nginx:alpine

# Install sed untuk melakukan penggantian teks
RUN apk add --no-cache sed

# Copy file HTML dan CSS ke dalam container
COPY html/index.html /usr/share/nginx/html/index.html
COPY html/style.css /usr/share/nginx/html/style.css

# Mengganti placeholder dengan data dari build arguments
ARG FULL_NAME
ARG ROLE
ARG UNIVERSITY
ARG SEMESTER
ARG EMAIL
ARG LOCATION
ARG BIO
ARG SKILLS

RUN sed -i "s/FULL_NAME_PLACEHOLDER/${FULL_NAME}/g" /usr/share/nginx/html/index.html && \
    sed -i "s/ROLE_PLACEHOLDER/${ROLE}/g" /usr/share/nginx/html/index.html && \
    sed -i "s/UNIVERSITY_PLACEHOLDER/${UNIVERSITY}/g" /usr/share/nginx/html/index.html && \
    sed -i "s/SEMESTER_PLACEHOLDER/${SEMESTER}/g" /usr/share/nginx/html/index.html && \
    sed -i "s/EMAIL_PLACEHOLDER/${EMAIL}/g" /usr/share/nginx/html/index.html && \
    sed -i "s/LOCATION_PLACEHOLDER/${LOCATION}/g" /usr/share/nginx/html/index.html && \
    sed -i "s/BIO_PLACEHOLDER/${BIO}/g" /usr/share/nginx/html/index.html && \
    sed -i "s/SKILLS_PLACEHOLDER/${SKILLS}/g" /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Menjalankan nginx
CMD ["nginx", "-g", "daemon off;"]
