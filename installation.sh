#!/bin/bash

sudo su

dnf install nginx -y
systemctl start nginx
systemctl enable nginx
