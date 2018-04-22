import pandas as np
import numpy as np
from sklearn.ensemble import GradientBoostingClassifier, RandomForestClassifier
from sklearn.metrics import confusion_matrix, precision_score, recall_score, accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.metrics import roc_curve, roc_auc_score
import matplotlib.pyplot as plt


class Payment_Decline_Detection(object):
    
    
    def __init__(self, X, y):
        
        
        self.X_train, self.X_test, self.y_train, self.y_test = train_test_split(X, y)


    def run_gradient_boosting(self):


        self.gradient_boosting = GradientBoostingClassifier(learning_rate=0.1, max_depth=5,
                                     n_estimators=1000, random_state=1)

        self.gradient_boosting.fit(self.X_train, self.y_train)

        self.predicts = self.gradient_boosting.predict(self.X_test)
        self.probas = self.gradient_boosting.predict_proba(self.X_test)

        return self._get_confusion_matrix(self.y_test, self.predicts)
    
    
    def _get_confusion_matrix(self, y_test, y_predict):


        p_score = precision_score(y_test, y_predict)
        r_score = recall_score(y_test, y_predict)

        tn, fp, fn, tp = confusion_matrix(y_test, y_predict).ravel()

        print("tp: {}, fn: {}\nfp: {}, tn: {}".format(tp, fn, fp, tn))
        print("\nprecision score:", p_score)
        print("\nrecall score:", r_score)
        print("\naccuracy score:", accuracy_score(y_test, y_predict))
        
        
    def plot_roc_curve(self):
        

        fpr, tpr, thresholds = roc_curve(self.y_test, self.probas[:,0])
        self.auc_score = round(roc_auc_score(self.y_test.values, self.probas[:,0]),4)
        plt.plot(fpr, tpr, label = f'Gradient Boosting\n {self.auc_score}')
        
        plt.xlabel("False Positive Rate")
        plt.ylabel("True Positive Rate ")
        plt.title("ROC Curve")
        plt.legend()
        plt.show()       

   
    def run(self):
        
        
        print("***** Gradient Boosting *****\n")
        self.run_gradient_boosting()
        print("\n\n")
        
        self.plot_roc_curve()