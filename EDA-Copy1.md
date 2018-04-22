{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Import the two CSVs into your scripting environment, under the names 'users' and 'orders'."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {},
   "outputs": [],
   "source": [
    "import pandas as pd\n",
    "import numpy as np\n",
    "import matplotlib.pyplot as plt\n",
    "from collections import defaultdict, OrderedDict\n",
    "%matplotlib inline"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {},
   "outputs": [],
   "source": [
    "# load both files"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "metadata": {},
   "outputs": [],
   "source": [
    "users = pd.read_csv('users.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "metadata": {},
   "outputs": [],
   "source": [
    "orders = pd.read_csv('orders.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Get shape and info data for users"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(10000, 5)"
      ]
     },
     "execution_count": 6,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "users.shape"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<class 'pandas.core.frame.DataFrame'>\n",
      "RangeIndex: 10000 entries, 0 to 9999\n",
      "Data columns (total 5 columns):\n",
      "id                      10000 non-null int64\n",
      "gender                  6690 non-null object\n",
      "age                     10000 non-null int64\n",
      "country                 10000 non-null object\n",
      "days_on_site_in_2016    10000 non-null int64\n",
      "dtypes: int64(3), object(2)\n",
      "memory usage: 390.7+ KB\n"
     ]
    }
   ],
   "source": [
    "users.info()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "metadata": {},
   "outputs": [],
   "source": [
    "# sample of data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>id</th>\n",
       "      <th>gender</th>\n",
       "      <th>age</th>\n",
       "      <th>country</th>\n",
       "      <th>days_on_site_in_2016</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>M</td>\n",
       "      <td>21</td>\n",
       "      <td>US</td>\n",
       "      <td>1</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>F</td>\n",
       "      <td>46</td>\n",
       "      <td>US</td>\n",
       "      <td>10</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>NaN</td>\n",
       "      <td>26</td>\n",
       "      <td>US</td>\n",
       "      <td>4</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>NaN</td>\n",
       "      <td>54</td>\n",
       "      <td>US</td>\n",
       "      <td>7</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>F</td>\n",
       "      <td>34</td>\n",
       "      <td>US</td>\n",
       "      <td>38</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   id gender  age country  days_on_site_in_2016\n",
       "0   1      M   21      US                     1\n",
       "1   2      F   46      US                    10\n",
       "2   3    NaN   26      US                     4\n",
       "3   4    NaN   54      US                     7\n",
       "4   5      F   34      US                    38"
      ]
     },
     "execution_count": 9,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "users.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(51738, 7)"
      ]
     },
     "execution_count": 10,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "orders.shape"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<class 'pandas.core.frame.DataFrame'>\n",
      "RangeIndex: 51738 entries, 0 to 51737\n",
      "Data columns (total 7 columns):\n",
      "id                   51738 non-null int64\n",
      "user_id              51738 non-null int64\n",
      "order_time           51738 non-null object\n",
      "item_total           51738 non-null float64\n",
      "shipping_cost        51738 non-null int64\n",
      "discounts_applied    4300 non-null float64\n",
      "payment_reject       51738 non-null bool\n",
      "dtypes: bool(1), float64(2), int64(3), object(1)\n",
      "memory usage: 2.4+ MB\n"
     ]
    }
   ],
   "source": [
    "orders.info()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>id</th>\n",
       "      <th>user_id</th>\n",
       "      <th>order_time</th>\n",
       "      <th>item_total</th>\n",
       "      <th>shipping_cost</th>\n",
       "      <th>discounts_applied</th>\n",
       "      <th>payment_reject</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>9852</td>\n",
       "      <td>2016-01-01 0:03:11</td>\n",
       "      <td>60.69</td>\n",
       "      <td>10</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>2784</td>\n",
       "      <td>2016-01-01 0:09:32</td>\n",
       "      <td>123.91</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>1619</td>\n",
       "      <td>2016-01-01 0:17:26</td>\n",
       "      <td>119.75</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>9725</td>\n",
       "      <td>2016-01-01 0:44:04</td>\n",
       "      <td>151.92</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>8892</td>\n",
       "      <td>2016-01-01 0:52:23</td>\n",
       "      <td>153.27</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   id  user_id          order_time  item_total  shipping_cost  \\\n",
       "0   1     9852  2016-01-01 0:03:11       60.69             10   \n",
       "1   2     2784  2016-01-01 0:09:32      123.91             15   \n",
       "2   3     1619  2016-01-01 0:17:26      119.75             15   \n",
       "3   4     9725  2016-01-01 0:44:04      151.92             15   \n",
       "4   5     8892  2016-01-01 0:52:23      153.27             15   \n",
       "\n",
       "   discounts_applied  payment_reject  \n",
       "0                NaN           False  \n",
       "1                NaN           False  \n",
       "2                NaN           False  \n",
       "3                NaN           False  \n",
       "4                NaN           False  "
      ]
     },
     "execution_count": 12,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "orders.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "metadata": {},
   "outputs": [],
   "source": [
    "# We don't need column 'id'. Just the user_id\n",
    "orders.drop(['id'], axis=1, inplace=True)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### What factors determine the shipping_cost amount?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "metadata": {},
   "outputs": [],
   "source": [
    "# merge both tables"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "metadata": {},
   "outputs": [],
   "source": [
    "users_orders = pd.merge(orders, users, how='left', left_on='user_id', right_on='id')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "metadata": {},
   "outputs": [],
   "source": [
    "users_orders.drop(['id'], axis=1, inplace=True)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>user_id</th>\n",
       "      <th>order_time</th>\n",
       "      <th>item_total</th>\n",
       "      <th>shipping_cost</th>\n",
       "      <th>discounts_applied</th>\n",
       "      <th>payment_reject</th>\n",
       "      <th>gender</th>\n",
       "      <th>age</th>\n",
       "      <th>country</th>\n",
       "      <th>days_on_site_in_2016</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>9852</td>\n",
       "      <td>2016-01-01 0:03:11</td>\n",
       "      <td>60.69</td>\n",
       "      <td>10</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>26</td>\n",
       "      <td>US</td>\n",
       "      <td>29</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2784</td>\n",
       "      <td>2016-01-01 0:09:32</td>\n",
       "      <td>123.91</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>47</td>\n",
       "      <td>US</td>\n",
       "      <td>28</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>1619</td>\n",
       "      <td>2016-01-01 0:17:26</td>\n",
       "      <td>119.75</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>M</td>\n",
       "      <td>40</td>\n",
       "      <td>US</td>\n",
       "      <td>29</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>9725</td>\n",
       "      <td>2016-01-01 0:44:04</td>\n",
       "      <td>151.92</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>F</td>\n",
       "      <td>40</td>\n",
       "      <td>US</td>\n",
       "      <td>3</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>8892</td>\n",
       "      <td>2016-01-01 0:52:23</td>\n",
       "      <td>153.27</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>32</td>\n",
       "      <td>US</td>\n",
       "      <td>10</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   user_id          order_time  item_total  shipping_cost  discounts_applied  \\\n",
       "0     9852  2016-01-01 0:03:11       60.69             10                NaN   \n",
       "1     2784  2016-01-01 0:09:32      123.91             15                NaN   \n",
       "2     1619  2016-01-01 0:17:26      119.75             15                NaN   \n",
       "3     9725  2016-01-01 0:44:04      151.92             15                NaN   \n",
       "4     8892  2016-01-01 0:52:23      153.27             15                NaN   \n",
       "\n",
       "   payment_reject gender  age country  days_on_site_in_2016  \n",
       "0           False    NaN   26      US                    29  \n",
       "1           False    NaN   47      US                    28  \n",
       "2           False      M   40      US                    29  \n",
       "3           False      F   40      US                     3  \n",
       "4           False    NaN   32      US                    10  "
      ]
     },
     "execution_count": 17,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "users_orders.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(51738, 10)"
      ]
     },
     "execution_count": 18,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "users_orders.shape"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "metadata": {},
   "outputs": [],
   "source": [
    "# get unique values of shipping costs"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "array([10, 15, 25, 20])"
      ]
     },
     "execution_count": 20,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "orders['shipping_cost'].unique()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "metadata": {},
   "outputs": [],
   "source": [
    "# scatter matrix to see any obvious correlations"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "metadata": {},
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "/Users/steventa/anaconda3/lib/python3.6/site-packages/matplotlib/axes/_base.py:2918: UserWarning: Attempting to set identical left==right results\n",
      "in singular transformations; automatically expanding.\n",
      "left=5.0, right=5.0\n",
      "  'left=%s, right=%s') % (left, right))\n",
      "/Users/steventa/anaconda3/lib/python3.6/site-packages/matplotlib/axes/_base.py:3239: UserWarning: Attempting to set identical bottom==top results\n",
      "in singular transformations; automatically expanding.\n",
      "bottom=5.0, top=5.0\n",
      "  'bottom=%s, top=%s') % (bottom, top))\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "''"
      ]
     },
     "execution_count": 22,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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\nm0Pj7uPSVvHxXJqMQ3Lg5IN7zvPJh44OrDk66f3NNZWQKynx7OkOGjrDBDwuDCuOoVpQpi1uWjQH\no5w/GKG+M0y+V2djdT5d4QT9MZNrlxSlO8S0WliUl+4QFCXneHQdBlLAHL5AlxGC8ThGhtYhH1ln\n/NA4SffIZPx1q4v5/vtu5KlXW3imvpW/f+vk64xf6k0by/nWe65j3TgDQq+kZmctDuDsHCbv6mOj\npEQwZlAWcPPGq6v423uuorrAne6Qspbfo3O2PcyF7gjBqEFfxKC+M8KKcj8LCj0sL8vthFRVmlGU\n1CvxDV+ZcjtnrwdzgduRVf2hM0F9p0FinhRPePJUNwB3bK6acjL+7TdvHFre/ZGNfOs91wHwnT9Z\nP6X9DJ5EWDDhxEUzoVrIlZS4YVkJL5/rIhQ3eaWhB8NSSdNUOTUo9DopC7hZX11Af8zkQneEwjyd\nt12ziJhpUehzUVPqT3eoaeVQ396KknL9seEOEomEZLamJ7trfSVdoThPn+qcpT3Of05AOERGzD45\nGR++ZTE/fa6RvnHu3/yFx3j1c3ePWjcyMR6vy8k9Wxdxz9bLZ26+ZcUSGnZlTt/xQSohV1LCsGzK\nAh5OtXZQ1x5SrZhT5BRQme8m4HGR79VZX51Pqd/DTctLKfCpMn8jnWsfv++hoihzoyM0nJDPZiL4\ny/0XU16+T5AdJQPH89p1ZfzufzM3IW/YtWNUQv2ZN2zggecax92+OzqcL7S2tvLTA6k9ObtnbRn/\nezxZLOBr98zdbKAqIVdSojLfQ3Gei6hhIZDMj4tpqaFroAlBZ8ggakjipsmes12sqshHStixsSrd\nIWaU0kJfukNQlJyjj7g0NZsXqVKdGGsCdIeW1fNleJ0ahpW5pxTT6fbxwNMn+NqT5+Ygmol9+73X\n8+0UPE9W9yEXQnxDCLFbCPGtdMeiXJktYfeZDnSHhkPL6rddyhk2xC1JzLTpiSToDhu0BeM0dIYp\nzkv222zvj3GqtR/LztyDcKrsOdaS7hAUJeeUB4bHBXmyuKnPlmR1Mg7w9Mk2sruNf7S/vH0p3/rd\n9JPxpTtr57Tv92zJ2o+NEGIzkCel3CaE+I4Q4jop5SvpjksZ26ELPRxq6kMAtpw/B4pUsyX0Rk0s\nSxI3LTr6Y3SG4vx87wUsW7Kqws/d66twaLnbkfqqpSXw7Pl0h6EoOWV1ZYBXm5ITk5UFPETSHE8u\n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\nAAAASUVORK5CYII=\n",
      "text/plain": [
       "<matplotlib.figure.Figure at 0x111d352b0>"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pd.plotting.scatter_matrix(users_orders, figsize=(12,12))\n",
    ";"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "metadata": {},
   "outputs": [],
   "source": [
    "# get correlation scores"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>user_id</th>\n",
       "      <th>item_total</th>\n",
       "      <th>shipping_cost</th>\n",
       "      <th>discounts_applied</th>\n",
       "      <th>payment_reject</th>\n",
       "      <th>age</th>\n",
       "      <th>days_on_site_in_2016</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>user_id</th>\n",
       "      <td>1.000000</td>\n",
       "      <td>0.011033</td>\n",
       "      <td>0.002875</td>\n",
       "      <td>NaN</td>\n",
       "      <td>0.002579</td>\n",
       "      <td>0.006488</td>\n",
       "      <td>-0.014082</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>item_total</th>\n",
       "      <td>0.011033</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>0.598568</td>\n",
       "      <td>NaN</td>\n",
       "      <td>0.000142</td>\n",
       "      <td>0.562673</td>\n",
       "      <td>-0.003665</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>shipping_cost</th>\n",
       "      <td>0.002875</td>\n",
       "      <td>0.598568</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>NaN</td>\n",
       "      <td>-0.008376</td>\n",
       "      <td>0.260400</td>\n",
       "      <td>0.005374</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>discounts_applied</th>\n",
       "      <td>NaN</td>\n",
       "      <td>NaN</td>\n",
       "      <td>NaN</td>\n",
       "      <td>NaN</td>\n",
       "      <td>NaN</td>\n",
       "      <td>NaN</td>\n",
       "      <td>NaN</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>payment_reject</th>\n",
       "      <td>0.002579</td>\n",
       "      <td>0.000142</td>\n",
       "      <td>-0.008376</td>\n",
       "      <td>NaN</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>0.004397</td>\n",
       "      <td>0.004387</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>age</th>\n",
       "      <td>0.006488</td>\n",
       "      <td>0.562673</td>\n",
       "      <td>0.260400</td>\n",
       "      <td>NaN</td>\n",
       "      <td>0.004397</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>-0.007627</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>days_on_site_in_2016</th>\n",
       "      <td>-0.014082</td>\n",
       "      <td>-0.003665</td>\n",
       "      <td>0.005374</td>\n",
       "      <td>NaN</td>\n",
       "      <td>0.004387</td>\n",
       "      <td>-0.007627</td>\n",
       "      <td>1.000000</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "                       user_id  item_total  shipping_cost  discounts_applied  \\\n",
       "user_id               1.000000    0.011033       0.002875                NaN   \n",
       "item_total            0.011033    1.000000       0.598568                NaN   \n",
       "shipping_cost         0.002875    0.598568       1.000000                NaN   \n",
       "discounts_applied          NaN         NaN            NaN                NaN   \n",
       "payment_reject        0.002579    0.000142      -0.008376                NaN   \n",
       "age                   0.006488    0.562673       0.260400                NaN   \n",
       "days_on_site_in_2016 -0.014082   -0.003665       0.005374                NaN   \n",
       "\n",
       "                      payment_reject       age  days_on_site_in_2016  \n",
       "user_id                     0.002579  0.006488             -0.014082  \n",
       "item_total                  0.000142  0.562673             -0.003665  \n",
       "shipping_cost              -0.008376  0.260400              0.005374  \n",
       "discounts_applied                NaN       NaN                   NaN  \n",
       "payment_reject              1.000000  0.004397              0.004387  \n",
       "age                         0.004397  1.000000             -0.007627  \n",
       "days_on_site_in_2016        0.004387 -0.007627              1.000000  "
      ]
     },
     "execution_count": 24,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "users_orders.corr()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### shipping cost and item total have pearson correlation of ~0.6"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "''"
      ]
     },
     "execution_count": 25,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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\nQmCC\n",
      "text/plain": [
       "<matplotlib.figure.Figure at 0x1134e4c88>"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# plot relationship item total to shipping cost\n",
    "plt.plot(users_orders['item_total'], users_orders['shipping_cost'])\n",
    ";"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### How about percent of shipping to item total?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>user_id</th>\n",
       "      <th>order_time</th>\n",
       "      <th>item_total</th>\n",
       "      <th>shipping_cost</th>\n",
       "      <th>discounts_applied</th>\n",
       "      <th>payment_reject</th>\n",
       "      <th>gender</th>\n",
       "      <th>age</th>\n",
       "      <th>country</th>\n",
       "      <th>days_on_site_in_2016</th>\n",
       "      <th>precent_cost_shipping</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>9852</td>\n",
       "      <td>2016-01-01 0:03:11</td>\n",
       "      <td>60.69</td>\n",
       "      <td>10</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>26</td>\n",
       "      <td>US</td>\n",
       "      <td>29</td>\n",
       "      <td>0.16</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2784</td>\n",
       "      <td>2016-01-01 0:09:32</td>\n",
       "      <td>123.91</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>47</td>\n",
       "      <td>US</td>\n",
       "      <td>28</td>\n",
       "      <td>0.12</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>1619</td>\n",
       "      <td>2016-01-01 0:17:26</td>\n",
       "      <td>119.75</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>M</td>\n",
       "      <td>40</td>\n",
       "      <td>US</td>\n",
       "      <td>29</td>\n",
       "      <td>0.13</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>9725</td>\n",
       "      <td>2016-01-01 0:44:04</td>\n",
       "      <td>151.92</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>F</td>\n",
       "      <td>40</td>\n",
       "      <td>US</td>\n",
       "      <td>3</td>\n",
       "      <td>0.10</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>8892</td>\n",
       "      <td>2016-01-01 0:52:23</td>\n",
       "      <td>153.27</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>32</td>\n",
       "      <td>US</td>\n",
       "      <td>10</td>\n",
       "      <td>0.10</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   user_id          order_time  item_total  shipping_cost  discounts_applied  \\\n",
       "0     9852  2016-01-01 0:03:11       60.69             10                NaN   \n",
       "1     2784  2016-01-01 0:09:32      123.91             15                NaN   \n",
       "2     1619  2016-01-01 0:17:26      119.75             15                NaN   \n",
       "3     9725  2016-01-01 0:44:04      151.92             15                NaN   \n",
       "4     8892  2016-01-01 0:52:23      153.27             15                NaN   \n",
       "\n",
       "   payment_reject gender  age country  days_on_site_in_2016  \\\n",
       "0           False    NaN   26      US                    29   \n",
       "1           False    NaN   47      US                    28   \n",
       "2           False      M   40      US                    29   \n",
       "3           False      F   40      US                     3   \n",
       "4           False    NaN   32      US                    10   \n",
       "\n",
       "   precent_cost_shipping  \n",
       "0                   0.16  \n",
       "1                   0.12  \n",
       "2                   0.13  \n",
       "3                   0.10  \n",
       "4                   0.10  "
      ]
     },
     "execution_count": 26,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# first make a column that calculates percent of cost shipping\n",
    "users_orders['precent_cost_shipping'] = round(users_orders['shipping_cost'] / users_orders['item_total'],2)\n",
    "# look at precent_cost_shipping column at the end\n",
    "users_orders.head()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Could it be just an average % for shipping costs?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "11.48"
      ]
     },
     "execution_count": 27,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "round(users_orders['precent_cost_shipping'].mean()*100, 2)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### It's possible the shipping cost is 12% or 10-15%. But let's try to see more relationships"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "metadata": {},
   "outputs": [],
   "source": [
    "# plot distribution of item totals"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "''"
      ]
     },
     "execution_count": 29,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<matplotlib.figure.Figure at 0x1134da128>"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "plt.hist(users_orders['item_total'])\n",
    ";"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "metadata": {},
   "outputs": [],
   "source": [
    "# plot distribution of shipping costs"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "''"
      ]
     },
     "execution_count": 31,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAAYcAAAD8CAYAAACcjGjIAAAABHNCSVQICAgIfAhkiAAAAAlwSFlz\nAAALEgAACxIB0t1+/AAAADl0RVh0U29mdHdhcmUAbWF0cGxvdGxpYiB2ZXJzaW9uIDIuMS4wLCBo\ndHRwOi8vbWF0cGxvdGxpYi5vcmcvpW3flQAAEU9JREFUeJzt3X+s3XV9x/Hna1SMm3MUKYxAXZmp\niWhcxYpNdJniVgouFhNdIIs0jqSGwCKLy6yaDKeSoE5NSJSFhYaSMZEJjibW1aYhMyaCFER+WFlv\nkEFtB2VFZSHRge/9cT6NZ/dzbu/tvaXnlD4fyTfne97fz/d73ue23/vq98c5TVUhSdKw3xh3A5Kk\nyWM4SJI6hoMkqWM4SJI6hoMkqWM4SJI6hoMkqWM4SJI6hoMkqbNo3A3M10knnVTLli0bdxuSdFS5\n5557nqqqJbONO2rDYdmyZezYsWPcbUjSUSXJf85lnKeVJEkdw0GS1DEcJEkdw0GS1DEcJEkdw0GS\n1DEcJEkdw0GS1DEcJEmdo/YT0jpylm34xrhbOKo8evW7xt2CtGAeOUiSOoaDJKljOEiSOoaDJKlj\nOEiSOoaDJKljOEiSOoaDJKljOEiSOoaDJKljOEiSOoaDJKljOEiSOoaDJKljOEiSOoaDJKljOEiS\nOoaDJKljOEiSOrOGQ5KlSe5IsjPJQ0k+1OqfSPKTJPe16fyhdT6aZCrJw0nOHaqvabWpJBuG6mck\nuSvJriRfTXL84X6jkqS5m8uRw3PAh6vqtcAq4LIkZ7ZlX6yqFW3aAtCWXQi8DlgDfDnJcUmOA74E\nnAecCVw0tJ3PtG0tB54GLjlM70+SNA+zhkNV7a2qe9v8M8BO4LSDrLIWuLmqflFVPwamgLPbNFVV\nj1TVL4GbgbVJApwDfK2tvwm4YL5vSJK0cId0zSHJMuCNwF2tdHmS+5NsTLK41U4DHh9abXerzVR/\nJfDTqnpuWl2SNCZzDockLwduBa6oqp8D1wKvBlYAe4HPHxg6YvWaR31UD+uT7EiyY9++fXNtXZJ0\niOYUDklewiAYbqqq2wCq6omqer6qfgX8I4PTRjD4l//SodVPB/YcpP4UcEKSRdPqnaq6rqpWVtXK\nJUuWzKV1SdI8zOVupQDXAzur6gtD9VOHhr0HeLDNbwYuTPLSJGcAy4HvAXcDy9udScczuGi9uaoK\n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\n",
      "text/plain": [
       "<matplotlib.figure.Figure at 0x113406470>"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "plt.hist(users_orders['shipping_cost'], bins=4)\n",
    ";"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Notice how each unique shipping cost lines up with our distribution of item totals. This may be calculated by range."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "metadata": {},
   "outputs": [],
   "source": [
    "# get range of item total"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "180.0"
      ]
     },
     "execution_count": 33,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "max_item_total = users_orders['item_total'].max()\n",
    "min_item_total = users_orders['item_total'].min()\n",
    "range_item_total = max_item_total - min_item_total\n",
    "round(range_item_total)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "metadata": {},
   "outputs": [],
   "source": [
    "# get class size of 4"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "45.0"
      ]
     },
     "execution_count": 35,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "unique_items_size = len(users_orders['shipping_cost'].unique())\n",
    "class_size = range_item_total / unique_items_size\n",
    "round(class_size)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### start with min and calculate each class until max"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "OrderedDict([(10, (43, 87)),\n",
       "             (15, (87, 131)),\n",
       "             (20, (131, 175)),\n",
       "             (25, (175, 219))])"
      ]
     },
     "execution_count": 36,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "curr = int(min_item_total)\n",
    "dict_of_class_ranges = OrderedDict()\n",
    "sorted_shipping = sorted(users_orders['shipping_cost'].unique())\n",
    "\n",
    "for item in sorted_shipping:\n",
    "    dict_of_class_ranges[item] = (curr, curr+int(class_size))\n",
    "    curr += int(class_size)\n",
    "    \n",
    "dict_of_class_ranges"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Rounded Item total : shipping cost\n",
    "#### 0-100 : 10\n",
    "#### 100-150 : 15\n",
    "#### 150-200 : 20\n",
    "#### 200+ : 25"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Freeform: Are there any trends in consumer behavior that you were able to observe?  "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>user_id</th>\n",
       "      <th>order_time</th>\n",
       "      <th>item_total</th>\n",
       "      <th>shipping_cost</th>\n",
       "      <th>discounts_applied</th>\n",
       "      <th>payment_reject</th>\n",
       "      <th>gender</th>\n",
       "      <th>age</th>\n",
       "      <th>country</th>\n",
       "      <th>days_on_site_in_2016</th>\n",
       "      <th>precent_cost_shipping</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>9852</td>\n",
       "      <td>2016-01-01 0:03:11</td>\n",
       "      <td>60.69</td>\n",
       "      <td>10</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>26</td>\n",
       "      <td>US</td>\n",
       "      <td>29</td>\n",
       "      <td>0.16</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2784</td>\n",
       "      <td>2016-01-01 0:09:32</td>\n",
       "      <td>123.91</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>47</td>\n",
       "      <td>US</td>\n",
       "      <td>28</td>\n",
       "      <td>0.12</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>1619</td>\n",
       "      <td>2016-01-01 0:17:26</td>\n",
       "      <td>119.75</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>M</td>\n",
       "      <td>40</td>\n",
       "      <td>US</td>\n",
       "      <td>29</td>\n",
       "      <td>0.13</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>9725</td>\n",
       "      <td>2016-01-01 0:44:04</td>\n",
       "      <td>151.92</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>F</td>\n",
       "      <td>40</td>\n",
       "      <td>US</td>\n",
       "      <td>3</td>\n",
       "      <td>0.10</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>8892</td>\n",
       "      <td>2016-01-01 0:52:23</td>\n",
       "      <td>153.27</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>32</td>\n",
       "      <td>US</td>\n",
       "      <td>10</td>\n",
       "      <td>0.10</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   user_id          order_time  item_total  shipping_cost  discounts_applied  \\\n",
       "0     9852  2016-01-01 0:03:11       60.69             10                NaN   \n",
       "1     2784  2016-01-01 0:09:32      123.91             15                NaN   \n",
       "2     1619  2016-01-01 0:17:26      119.75             15                NaN   \n",
       "3     9725  2016-01-01 0:44:04      151.92             15                NaN   \n",
       "4     8892  2016-01-01 0:52:23      153.27             15                NaN   \n",
       "\n",
       "   payment_reject gender  age country  days_on_site_in_2016  \\\n",
       "0           False    NaN   26      US                    29   \n",
       "1           False    NaN   47      US                    28   \n",
       "2           False      M   40      US                    29   \n",
       "3           False      F   40      US                     3   \n",
       "4           False    NaN   32      US                    10   \n",
       "\n",
       "   precent_cost_shipping  \n",
       "0                   0.16  \n",
       "1                   0.12  \n",
       "2                   0.13  \n",
       "3                   0.10  \n",
       "4                   0.10  "
      ]
     },
     "execution_count": 37,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# reminder of our dataset\n",
    "users_orders.head()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Column payment_reject offers a chance to use classification. Can we use the other features (columns) to predict the behavior of payment rejections?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "metadata": {},
   "outputs": [],
   "source": [
    "# make a copy of our dataset since we're handling a different problem"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 39,
   "metadata": {},
   "outputs": [],
   "source": [
    "payment_df = users_orders.copy()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 40,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>user_id</th>\n",
       "      <th>order_time</th>\n",
       "      <th>item_total</th>\n",
       "      <th>shipping_cost</th>\n",
       "      <th>discounts_applied</th>\n",
       "      <th>payment_reject</th>\n",
       "      <th>gender</th>\n",
       "      <th>age</th>\n",
       "      <th>country</th>\n",
       "      <th>days_on_site_in_2016</th>\n",
       "      <th>precent_cost_shipping</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>9852</td>\n",
       "      <td>2016-01-01 0:03:11</td>\n",
       "      <td>60.69</td>\n",
       "      <td>10</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>26</td>\n",
       "      <td>US</td>\n",
       "      <td>29</td>\n",
       "      <td>0.16</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2784</td>\n",
       "      <td>2016-01-01 0:09:32</td>\n",
       "      <td>123.91</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>47</td>\n",
       "      <td>US</td>\n",
       "      <td>28</td>\n",
       "      <td>0.12</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>1619</td>\n",
       "      <td>2016-01-01 0:17:26</td>\n",
       "      <td>119.75</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>M</td>\n",
       "      <td>40</td>\n",
       "      <td>US</td>\n",
       "      <td>29</td>\n",
       "      <td>0.13</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>9725</td>\n",
       "      <td>2016-01-01 0:44:04</td>\n",
       "      <td>151.92</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>F</td>\n",
       "      <td>40</td>\n",
       "      <td>US</td>\n",
       "      <td>3</td>\n",
       "      <td>0.10</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>8892</td>\n",
       "      <td>2016-01-01 0:52:23</td>\n",
       "      <td>153.27</td>\n",
       "      <td>15</td>\n",
       "      <td>NaN</td>\n",
       "      <td>False</td>\n",
       "      <td>NaN</td>\n",
       "      <td>32</td>\n",
       "      <td>US</td>\n",
       "      <td>10</td>\n",
       "      <td>0.10</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   user_id          order_time  item_total  shipping_cost  discounts_applied  \\\n",
       "0     9852  2016-01-01 0:03:11       60.69             10                NaN   \n",
       "1     2784  2016-01-01 0:09:32      123.91             15                NaN   \n",
       "2     1619  2016-01-01 0:17:26      119.75             15                NaN   \n",
       "3     9725  2016-01-01 0:44:04      151.92             15                NaN   \n",
       "4     8892  2016-01-01 0:52:23      153.27             15                NaN   \n",
       "\n",
       "   payment_reject gender  age country  days_on_site_in_2016  \\\n",
       "0           False    NaN   26      US                    29   \n",
       "1           False    NaN   47      US                    28   \n",
       "2           False      M   40      US                    29   \n",
       "3           False      F   40      US                     3   \n",
       "4           False    NaN   32      US                    10   \n",
       "\n",
       "   precent_cost_shipping  \n",
       "0                   0.16  \n",
       "1                   0.12  \n",
       "2                   0.13  \n",
       "3                   0.10  \n",
       "4                   0.10  "
      ]
     },
     "execution_count": 40,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "payment_df.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 41,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<class 'pandas.core.frame.DataFrame'>\n",
      "Int64Index: 51738 entries, 0 to 51737\n",
      "Data columns (total 11 columns):\n",
      "user_id                  51738 non-null int64\n",
      "order_time               51738 non-null object\n",
      "item_total               51738 non-null float64\n",
      "shipping_cost            51738 non-null int64\n",
      "discounts_applied        4300 non-null float64\n",
      "payment_reject           51738 non-null bool\n",
      "gender                   34352 non-null object\n",
      "age                      51738 non-null int64\n",
      "country                  51738 non-null object\n",
      "days_on_site_in_2016     51738 non-null int64\n",
      "precent_cost_shipping    51738 non-null float64\n",
      "dtypes: bool(1), float64(3), int64(4), object(3)\n",
      "memory usage: 4.4+ MB\n"
     ]
    }
   ],
   "source": [
    "payment_df.info()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Time to clean our data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 42,
   "metadata": {},
   "outputs": [],
   "source": [
    "# To classify using gender, we need to dummify them so as to make them binary choices\n",
    "payment_df['gender'] = pd.get_dummies(payment_df['gender'])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 43,
   "metadata": {},
   "outputs": [],
   "source": [
    "# same for country\n",
    "payment_df['country'] = pd.get_dummies(payment_df['country'])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 44,
   "metadata": {},
   "outputs": [],
   "source": [
    "# discounts_applied has lots of missing values. Replace with zeros\n",
    "payment_df['discounts_applied'].fillna(value=0, inplace=True)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 45,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<class 'pandas.core.frame.DataFrame'>\n",
      "Int64Index: 51738 entries, 0 to 51737\n",
      "Data columns (total 11 columns):\n",
      "user_id                  51738 non-null int64\n",
      "order_time               51738 non-null object\n",
      "item_total               51738 non-null float64\n",
      "shipping_cost            51738 non-null int64\n",
      "discounts_applied        51738 non-null float64\n",
      "payment_reject           51738 non-null bool\n",
      "gender                   51738 non-null uint8\n",
      "age                      51738 non-null int64\n",
      "country                  51738 non-null uint8\n",
      "days_on_site_in_2016     51738 non-null int64\n",
      "precent_cost_shipping    51738 non-null float64\n",
      "dtypes: bool(1), float64(3), int64(4), object(1), uint8(2)\n",
      "memory usage: 3.7+ MB\n"
     ]
    }
   ],
   "source": [
    "# quick look at data to check for no nulls, objects, strings\n",
    "payment_df.info()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Import Payment_Decline_Detection class that I built"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 46,
   "metadata": {},
   "outputs": [],
   "source": [
    "from Payment_Decline_Detection import Payment_Decline_Detection"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 47,
   "metadata": {},
   "outputs": [],
   "source": [
    "# data split of features and labels (what we will predict)\n",
    "X = payment_df.drop(['payment_reject', 'user_id', 'order_time'], axis=1)\n",
    "y = payment_df['payment_reject']"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 48,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>item_total</th>\n",
       "      <th>shipping_cost</th>\n",
       "      <th>discounts_applied</th>\n",
       "      <th>gender</th>\n",
       "      <th>age</th>\n",
       "      <th>country</th>\n",
       "      <th>days_on_site_in_2016</th>\n",
       "      <th>precent_cost_shipping</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>60.69</td>\n",
       "      <td>10</td>\n",
       "      <td>0.0</td>\n",
       "      <td>0</td>\n",
       "      <td>26</td>\n",
       "      <td>0</td>\n",
       "      <td>29</td>\n",
       "      <td>0.16</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>123.91</td>\n",
       "      <td>15</td>\n",
       "      <td>0.0</td>\n",
       "      <td>0</td>\n",
       "      <td>47</td>\n",
       "      <td>0</td>\n",
       "      <td>28</td>\n",
       "      <td>0.12</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>119.75</td>\n",
       "      <td>15</td>\n",
       "      <td>0.0</td>\n",
       "      <td>0</td>\n",
       "      <td>40</td>\n",
       "      <td>0</td>\n",
       "      <td>29</td>\n",
       "      <td>0.13</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>151.92</td>\n",
       "      <td>15</td>\n",
       "      <td>0.0</td>\n",
       "      <td>1</td>\n",
       "      <td>40</td>\n",
       "      <td>0</td>\n",
       "      <td>3</td>\n",
       "      <td>0.10</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>153.27</td>\n",
       "      <td>15</td>\n",
       "      <td>0.0</td>\n",
       "      <td>0</td>\n",
       "      <td>32</td>\n",
       "      <td>0</td>\n",
       "      <td>10</td>\n",
       "      <td>0.10</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   item_total  shipping_cost  discounts_applied  gender  age  country  \\\n",
       "0       60.69             10                0.0       0   26        0   \n",
       "1      123.91             15                0.0       0   47        0   \n",
       "2      119.75             15                0.0       0   40        0   \n",
       "3      151.92             15                0.0       1   40        0   \n",
       "4      153.27             15                0.0       0   32        0   \n",
       "\n",
       "   days_on_site_in_2016  precent_cost_shipping  \n",
       "0                    29                   0.16  \n",
       "1                    28                   0.12  \n",
       "2                    29                   0.13  \n",
       "3                     3                   0.10  \n",
       "4                    10                   0.10  "
      ]
     },
     "execution_count": 48,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "X.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 49,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "0    False\n",
       "1    False\n",
       "2    False\n",
       "3    False\n",
       "4    False\n",
       "Name: payment_reject, dtype: bool"
      ]
     },
     "execution_count": 49,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "y.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 50,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Run module. Classifier we'll use is Gradient Boosting\n",
    "checker = Payment_Decline_Detection(X, y)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 51,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "***** Gradient Boosting *****\n",
      "\n",
      "tp: 1, fn: 126\n",
      "fp: 80, tn: 12728\n",
      "\n",
      "precision score: 0.0123456790123\n",
      "\n",
      "recall score: 0.00787401574803\n",
      "\n",
      "accuracy score: 0.98407421724\n",
      "\n",
      "\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nN0sKxhhj3P4fXkAv4lSNLSoAAAAASUVORK5CYII=\n",
      "text/plain": [
       "<matplotlib.figure.Figure at 0x11211ef60>"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "checker.run()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Only got 1 true positives. Not good."
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Also, our ROC curve looks terrible. This is what it should look like:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "![title](roc_intro3.png)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Our ROC curve looks like the dotted black line. Which means our model is as good as random."
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### This could be due to our True's of payment decline being such a small fraction of the overall label."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 52,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "False    51225\n",
       "True       513\n",
       "Name: payment_reject, dtype: int64"
      ]
     },
     "execution_count": 52,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "payment_df['payment_reject'].value_counts()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### True's are only 1% of our overall. A fast way to resolve this is to randomly chop down how many False's we have. "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### undersample until the positives get up to at least 20% of entire data set"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 53,
   "metadata": {},
   "outputs": [],
   "source": [
    "# get isFalse mask\n",
    "isFalse = payment_df['payment_reject'] == False"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 55,
   "metadata": {},
   "outputs": [],
   "source": [
    "only_false = payment_df[isFalse]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 56,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "False    51225\n",
       "Name: payment_reject, dtype: int64"
      ]
     },
     "execution_count": 56,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "only_false['payment_reject'].value_counts()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 57,
   "metadata": {},
   "outputs": [],
   "source": [
    "# get sample\n",
    "only_false_cut = only_false.sample(frac=.05, random_state=240)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 58,
   "metadata": {},
   "outputs": [],
   "source": [
    "# get isTrue mask\n",
    "isTrue = payment_df['payment_reject'] == True"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 59,
   "metadata": {},
   "outputs": [],
   "source": [
    "only_true = payment_df[isTrue]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 60,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "True    513\n",
       "Name: payment_reject, dtype: int64"
      ]
     },
     "execution_count": 60,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "only_true['payment_reject'].value_counts()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### combine both tables of chopped False's and all of True's"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 61,
   "metadata": {},
   "outputs": [],
   "source": [
    "payment_df_final = pd.concat([only_false_cut, only_true])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 62,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>user_id</th>\n",
       "      <th>order_time</th>\n",
       "      <th>item_total</th>\n",
       "      <th>shipping_cost</th>\n",
       "      <th>discounts_applied</th>\n",
       "      <th>payment_reject</th>\n",
       "      <th>gender</th>\n",
       "      <th>age</th>\n",
       "      <th>country</th>\n",
       "      <th>days_on_site_in_2016</th>\n",
       "      <th>precent_cost_shipping</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>40710</th>\n",
       "      <td>9178</td>\n",
       "      <td>2016-10-15 14:36:25</td>\n",
       "      <td>79.05</td>\n",
       "      <td>10</td>\n",
       "      <td>0.0</td>\n",
       "      <td>False</td>\n",
       "      <td>0</td>\n",
       "      <td>36</td>\n",
       "      <td>0</td>\n",
       "      <td>15</td>\n",
       "      <td>0.13</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>45591</th>\n",
       "      <td>7459</td>\n",
       "      <td>2016-11-18 19:11:55</td>\n",
       "      <td>140.16</td>\n",
       "      <td>15</td>\n",
       "      <td>0.0</td>\n",
       "      <td>False</td>\n",
       "      <td>0</td>\n",
       "      <td>41</td>\n",
       "      <td>0</td>\n",
       "      <td>17</td>\n",
       "      <td>0.11</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>49495</th>\n",
       "      <td>7321</td>\n",
       "      <td>2016-12-16 1:41:16</td>\n",
       "      <td>126.94</td>\n",
       "      <td>25</td>\n",
       "      <td>0.0</td>\n",
       "      <td>False</td>\n",
       "      <td>0</td>\n",
       "      <td>48</td>\n",
       "      <td>1</td>\n",
       "      <td>2</td>\n",
       "      <td>0.20</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>7729</th>\n",
       "      <td>1511</td>\n",
       "      <td>2016-02-25 5:26:41</td>\n",
       "      <td>100.74</td>\n",
       "      <td>10</td>\n",
       "      <td>0.0</td>\n",
       "      <td>False</td>\n",
       "      <td>0</td>\n",
       "      <td>32</td>\n",
       "      <td>0</td>\n",
       "      <td>29</td>\n",
       "      <td>0.10</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>47133</th>\n",
       "      <td>5666</td>\n",
       "      <td>2016-11-29 16:52:59</td>\n",
       "      <td>150.06</td>\n",
       "      <td>15</td>\n",
       "      <td>0.0</td>\n",
       "      <td>False</td>\n",
       "      <td>0</td>\n",
       "      <td>50</td>\n",
       "      <td>0</td>\n",
       "      <td>24</td>\n",
       "      <td>0.10</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "       user_id           order_time  item_total  shipping_cost  \\\n",
       "40710     9178  2016-10-15 14:36:25       79.05             10   \n",
       "45591     7459  2016-11-18 19:11:55      140.16             15   \n",
       "49495     7321   2016-12-16 1:41:16      126.94             25   \n",
       "7729      1511   2016-02-25 5:26:41      100.74             10   \n",
       "47133     5666  2016-11-29 16:52:59      150.06             15   \n",
       "\n",
       "       discounts_applied  payment_reject  gender  age  country  \\\n",
       "40710                0.0           False       0   36        0   \n",
       "45591                0.0           False       0   41        0   \n",
       "49495                0.0           False       0   48        1   \n",
       "7729                 0.0           False       0   32        0   \n",
       "47133                0.0           False       0   50        0   \n",
       "\n",
       "       days_on_site_in_2016  precent_cost_shipping  \n",
       "40710                    15                   0.13  \n",
       "45591                    17                   0.11  \n",
       "49495                     2                   0.20  \n",
       "7729                     29                   0.10  \n",
       "47133                    24                   0.10  "
      ]
     },
     "execution_count": 62,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "payment_df_final.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 63,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "False    2561\n",
       "True      513\n",
       "Name: payment_reject, dtype: int64"
      ]
     },
     "execution_count": 63,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# recount our values\n",
    "payment_df_final['payment_reject'].value_counts()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 64,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "20.031237797735262"
      ]
     },
     "execution_count": 64,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# got 20%\n",
    "(513 / 2561)* 100"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 65,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<class 'pandas.core.frame.DataFrame'>\n",
      "Int64Index: 3074 entries, 40710 to 51713\n",
      "Data columns (total 11 columns):\n",
      "user_id                  3074 non-null int64\n",
      "order_time               3074 non-null object\n",
      "item_total               3074 non-null float64\n",
      "shipping_cost            3074 non-null int64\n",
      "discounts_applied        3074 non-null float64\n",
      "payment_reject           3074 non-null bool\n",
      "gender                   3074 non-null uint8\n",
      "age                      3074 non-null int64\n",
      "country                  3074 non-null uint8\n",
      "days_on_site_in_2016     3074 non-null int64\n",
      "precent_cost_shipping    3074 non-null float64\n",
      "dtypes: bool(1), float64(3), int64(4), object(1), uint8(2)\n",
      "memory usage: 225.1+ KB\n"
     ]
    }
   ],
   "source": [
    "payment_df_final.info()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Now we're ready to retrain our model using our new data set"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 66,
   "metadata": {},
   "outputs": [],
   "source": [
    "X1 = payment_df_final.drop(['payment_reject', 'order_time', 'user_id'], axis=1)\n",
    "y1 = payment_df_final['payment_reject']"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 67,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(3074, 8)"
      ]
     },
     "execution_count": 67,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "X1.shape"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 68,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(3074,)"
      ]
     },
     "execution_count": 68,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "y1.shape"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 69,
   "metadata": {},
   "outputs": [],
   "source": [
    "checker1 = Payment_Decline_Detection(X1, y1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 70,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "***** Gradient Boosting *****\n",
      "\n",
      "tp: 6, fn: 131\n",
      "fp: 50, tn: 582\n",
      "\n",
      "precision score: 0.107142857143\n",
      "\n",
      "recall score: 0.043795620438\n",
      "\n",
      "accuracy score: 0.764629388817\n",
      "\n",
      "\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nT+/22cMOO4x169Ylk8L27dt5/fXXs8bXpk0bNm7cmNO9zJs3j+7duyfjmTJlChCMUurQoQNt27bN\nuP/tt9/miCOO4JprrqGqqoo33nijTtdOOO6443j66afZunUrmzZt4tlnn63T50WakkSH8k9HH8H0\nfxnIeQM6N3JE2ZXENBeNzcx48skn+d73vscdd9zBfvvtx957783tt9+e9vjzzz+f4cOHU1VVRWVl\nJT169ACgX79+jB07lsrKSrp06cLxxx+/22dbtmzJE088wYQJE9iwYQM7duzgqquuolevzGOXTzrp\nJG677TYqKyu57rrrGDt27C7vJzqC3Z127drx4IMPAkFH8IUXXkifPn3Ya6+9eOSRR7Luv+eee5g9\nezbNmzenZ8+eDBkyhGbNmrHHHnvQt29fxo0bx5FHHlnr9/Ooo45ixIgR9O3bly5dulBVVUW7du1q\n/ZxIU5A6smj5ms8Y0K19k08GCVZsTfWqqipPXWTnr3/9K4cffngjRSRx2LRpE/vssw+bN29m0KBB\nTJ48mX79dp0JRT93aWzphpYmRhUN6NY+uW9kZadGTwpmttjdax0PrpaCNEnjx49n+fLlbN26lQsu\nuGC3hCDSWKKJIF0CSPQbNHYSqK+SSwo3P/06yz/I79OAhXi0XHYVfQpapCmJjiIq9gSQTsklBRGR\nuExduIqF737MgG7tm/Sw0oYouaTQFP6iX7x4MePGjWPLli0MHTqUe++9d7ehpnPmzGHkyJHJ9QDG\njBnDDTfcAMBFF13EM888w/7778+yZV/OPL506VIuvfRSNm3aRNeuXZkyZQpt27Yt3I2JlLlE2aip\nDyttCA1JjcFll13G5MmTefPNN3nzzTf5/e9/n/a4448/niVLlrBkyZJkQoBgSot0n7nkkku47bbb\neO211xg9ejR33nlnbPcgIukV00ii+lBSyLM1a9bw2WefMXDgQMyMb3/72zz55JN1OsegQYOSTz9H\nrVixgkGDBgHBE9LRB+ZEJF6J0lGpU1LIs9WrV+8yvUNFRQWrV6efDXH+/Pn07duXIUOG1PoAGkDv\n3r2TM68+/vjjvP/++7V8QkQaKjqJHZR26QiUFPIu0xQQqfr168fKlStZunQpV155JaNGjar13A89\n9BATJ06kf//+bNy4kZYtW+YlZhHJLDHaaEC39vx09BElXTqCEuxobmwVFRXU1NQkt2tqajjggAN2\n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\nCI7vAAAAAElFTkSuQmCC\n",
      "text/plain": [
       "<matplotlib.figure.Figure at 0x118836390>"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# run gradient boosting round 2\n",
    "checker1.run()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 71,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "[('item_total', 0.64854341100025303),\n",
       " ('days_on_site_in_2016', 0.15021377900867927),\n",
       " ('age', 0.13065845724596903),\n",
       " ('precent_cost_shipping', 0.030383907800848389),\n",
       " ('gender', 0.021247376039918508),\n",
       " ('discounts_applied', 0.0095693712914495226),\n",
       " ('country', 0.0050170813830136404),\n",
       " ('shipping_cost', 0.0043666162298687718)]"
      ]
     },
     "execution_count": 71,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# a list of our models feature importance by rank\n",
    "sorted(list(zip(X1.columns, checker1.gradient_boosting.feature_importances_)), key = lambda x: x[1])[::-1]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### We still have too many false positives. We also have a lot of false negatives. There may not be enough data / features to predict the which payments will be declined."
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Next steps:\n",
    "    - explode dates out to days, hours, minutes, seconds etc to have more features\n",
    "    - run a grid search to tune parameters for our gradient boost model\n",
    "    - boosting our labels data set to make it bigger"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.6.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}