# TODO: A function for GridSearchCV
def gridsearch(x_train_res, y_train_res, model):
    import time
    import numpy as np
    from sklearn.model_selection import GridSearchCV
    np.random.seed(18)
    start = time.time()

    param_dist = {'max_depth': [ 3, 4, 5],
                  'max_features': ['auto', 'sqrt', 'log2', None],
                  'min_samples_split': [25, 35, 40, 45, 50, 55, 60, 65, 70],
                  }

    cv_model = GridSearchCV(model, cv=10,
                         param_grid=param_dist,
                         n_jobs=2)

    cv_model.fit(x_train_res, y_train_res)

    end = time.time()
    print("The time taken in grid search: {0: .2f}".format(end - start))

    return 'Best Parameters using grid search:', cv_model.best_params_


# TODO: A function for plotting AUC
def auc_chart(fpr, tpr, roc_auc):
    import matplotlib.pyplot as plt
    plt.figure(1)
    lw = 2
    plt.plot(fpr, tpr, color='green',
             lw=lw, label='AUC = %0.2f' % roc_auc)
    plt.plot([0, 1], [0, 1], color='navy', lw=lw, linestyle='--')

    plt.xlim([0.0, 1.0])
    plt.ylim([0.0, 1.05])
    plt.xlabel('False Positive Rate')
    plt.ylabel('True Positive Rate')
    plt.title('Area Under Curve')
    plt.legend(loc="lower right")
    plt.show()